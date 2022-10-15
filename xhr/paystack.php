<?php
if (IS_LOGGED == false) {
    header("Location: $site_url");
    exit();
}
$types = ["wallet"];
if ($option == "initialize") {
    if (
        !empty($_POST["type"]) &&
        in_array($_POST["type"], $types) &&
        !empty($_POST["email"]) &&
        filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)
    ) {
        $type = secure($_POST["type"]);
        $price = 0;

        if ($type == "wallet") {
            if (
                !empty($_POST["amount"]) &&
                is_numeric($_POST["amount"]) &&
                $_POST["amount"] > 0
            ) {
                $price = secure($_POST["amount"]);
                $callback_url =
                    $music->config->site_url .
                    "/endpoints/paystack/pay?type=wallet&amount=" .
                    $price;
            } else {
                $data["status"] = 400;
                $data["error"] = lang("Please check your details");
            }
        }
        if (!empty($price) && empty($data["error"])) {
            $result = [];
            $reference = uniqid();
            $price = (int) $price * 100;

            //Set other parameters as keys in the $postdata array
            $postdata = [
                "email" => $_POST["email"],
                "amount" => $price,
                "reference" => $reference,
                "callback_url" => $callback_url,
            ];
            $url = "https://api.paystack.co/transaction/initialize";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postdata)); //Post Fields
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $headers = [
                "Authorization: Bearer " . $music->config->paystack_secret_key,
                "Content-Type: application/json",
            ];
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

            $request = curl_exec($ch);

            curl_close($ch);

            if ($request) {
                $result = json_decode($request, true);
                if (!empty($result)) {
                    if (
                        !empty($result["status"]) &&
                        $result["status"] == 1 &&
                        !empty($result["data"]) &&
                        !empty($result["data"]["authorization_url"]) &&
                        !empty($result["data"]["access_code"])
                    ) {
                        $db->where("id", $user->id)->update(T_USERS, [
                            "paystack_ref" => $reference,
                        ]);
                        $data["status"] = 200;
                        $data["url"] = $result["data"]["authorization_url"];
                    } else {
                        $data["status"] = 400;
                        $data["error"] = $result["message"];
                    }
                } else {
                    $data["status"] = 400;
                    $data["error"] = lang("Please check your details");
                }
            } else {
                $data["status"] = 400;
                $data["error"] = lang("Please check your details");
            }
        }
    }
}

if ($option == "pay") {
    if (!empty($_GET["type"]) && in_array($_GET["type"], $types)) {
        $payment = CheckPaystackPayment($_GET["reference"]);
        if ($payment) {
            $type = secure($_GET["type"]);

            if ($type == "wallet") {
                $price = secure($_GET["amount"]);
                $updateUser = $db
                    ->where("id", $user->id)
                    ->update(T_USERS, ["wallet" => $db->inc($price)]);
                if ($updateUser) {
                    CreatePayment([
                        "user_id" => $user->id,
                        "amount" => $price,
                        "type" => "WALLET",
                        "pro_plan" => 0,
                        "info" => "Replenish My Balance",
                        "via" => "paystack",
                    ]);
                    header("Location: $site_url/ads");
                    exit();
                } else {
                    header(
                        "Location: $site_url/payment-error?reason=cant-create-payment"
                    );
                    exit();
                }
            }
        } else {
            header("Location: $site_url/payment-error?reason=not-found");
            exit();
        }
    }
    header("Location: $site_url");
    exit();
}
