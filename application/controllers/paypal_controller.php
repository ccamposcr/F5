<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Paypal_controller extends CI_Controller {
    private $host;
    private $client_id;
    private $secret;
    private $token;

    function __construct() {
        parent::__construct();
        /* SandBox */
        $this->host = 'https://api.sandbox.paypal.com';
        $this->client_id = 'AdB3iRARTpvKZx1jqjubgf8A3sOuAU2m8BVed7tD7cQ_0XD6EThMbjDlw8J9';
        $this->secret = 'EOUlnRASDZY8kDAikr1-gPMjTLCbQJ9YP9DTEIYypqy9MsVCg5Q0fKY8bvKz';
    }
 
    function get_access_token() {
        $grant_type = 'grant_type=client_credentials';
        $url = $this->host . '/v1/oauth2/token';
        $curl = curl_init($url); 
        curl_setopt($curl, CURLOPT_POST, true); 
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_USERPWD, $this->client_id . ":" . $this->secret);
        curl_setopt($curl, CURLOPT_HEADER, false); 
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($curl, CURLOPT_POSTFIELDS, $grant_type); 
        $response = curl_exec($curl);
        curl_close($curl);
        $json_resp = json_decode( $response );

        return $json_resp->access_token;
    }

    function make_post_call($data) {
        $url = $this->host . '/v1/payments/payment';
        $curl = curl_init($url); 
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
                    'Authorization: Bearer ' . $this->token,
                    'Accept: application/json',
                    'Content-Type: application/json'
                    ));
        
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data); 
        $response = curl_exec($curl);
        curl_close($curl);

        return json_decode($response, TRUE);
    }

    function acceptCreditCardPayment(){
        $number = ( isset($_POST['number']) ) ? strip_tags($_POST['number']) : '';
        $type = ( isset($_POST['type']) ) ? strip_tags($_POST['type']) : '';
        $expire_month = ( isset($_POST['expire_month']) ) ? strip_tags($_POST['expire_month']) : '';
        $expire_year = ( isset($_POST['expire_year']) ) ? strip_tags($_POST['expire_year']) : '';
        $cvv2 = ( isset($_POST['cvv2']) ) ? strip_tags($_POST['cvv2']) : '';
        $first_name = ( isset($_POST['first_name']) ) ? strip_tags($_POST['first_name']) : '';
        $last_name = ( isset($_POST['last_name']) ) ? strip_tags($_POST['last_name']) : '';
        $total = ( isset($_POST['total']) ) ? strip_tags($_POST['total']) : '';

        $payment = array(
        'intent' => 'sale',
        'payer' => array(
            'payment_method' => 'credit_card',
            'funding_instruments' => array ( array(
                    'credit_card' => array (
                        'number' => $number,
                        'type'   => $type,
                        'expire_month' => $expire_month,
                        'expire_year' => $expire_year,
                        'cvv2' => $cvv2,
                        'first_name' => $first_name,
                        'last_name' => $last_name
                        )
                    ))
            ),
        'transactions' => array (array(
                'amount' => array(
                    'total' => $total,
                    'currency' => 'USD'
                    ),
                'description' => 'payment by a credit card using a test script'
                ))
        );
        $data = json_encode($payment);
        $this->token = $this->get_access_token();
        $json_resp = $this->make_post_call($data);
        echo json_encode($json_resp);
    }
}
