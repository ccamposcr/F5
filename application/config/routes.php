<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller'] = "pages_controller";
$route['404_override'] = 'pages_controller/page_404';

//Reservaciones Routes

//Desamparados
$route['desamparados/(:num)/reservaciones'] = 'calendar_controller/calendar/';
$route['desamparados/(:num)/reservaciones/(:num)/(:any)'] = 'calendar_controller/calendar/$2/$3';

//Escazu
$route['escazu/(:num)/reservaciones'] = 'calendar_controller/calendar/';
$route['escazu/(:num)/reservaciones/(:num)/(:any)'] = 'calendar_controller/calendar/$2/$3';

/*  ------------------------------------------------------------------ */

//Admin Routes

//Desamparados
$route['desamparados/(:num)/admin'] = 'calendar_controller/admin/';
$route['desamparados/(:num)/admin/(:num)/(:any)'] = 'calendar_controller/admin/$2/$3';

//Escazu
$route['escazu/(:num)/admin'] = 'calendar_controller/admin/';
$route['escazu/(:num)/admin/(:num)/(:any)'] = 'calendar_controller/admin/$2/$3';

/* ------------------------------------------------------------------- */

//Services Routs
$route['getReservationByDay'] = 'api_controller/getReservationByDay';
$route['getReservationByTime'] = 'api_controller/getReservationByTime';
$route['getPitchByGroup'] = 'api_controller/getPitchByGroup';
$route['getGroup'] = 'api_controller/getGroup';
$route['getTemporaryReservationState'] = 'api_controller/getTemporaryReservationState';
$route['setTemporaryReservationState'] = 'api_controller/setTemporaryReservationState';
$route['checkIfReservationExist'] = 'api_controller/checkIfReservationExist';
$route['createReservation'] = 'api_controller/createReservation';
$route['setInactiveReservation'] = 'api_controller/setInactiveReservation';
$route['setInactiveReservationAllWeeks'] = 'api_controller/setInactiveReservationAllWeeks';
$route['checkExpiredReservations'] = 'check_expired_reservations_controller/checkExpiredReservations';
$route['sendEmail'] = 'email_controller/sendEmail';
$route['getClientsData'] = 'api_controller/getClientsData';
$route['changePassword'] = 'login_controller/changePassword';
$route['reserveAllWeeksSameDay'] = 'api_controller/reserveAllWeeksSameDay';
$route['checkAvailability'] = 'api_controller/checkAvailability';
$route['acceptCreditCardPayment'] = 'paypal_controller/acceptCreditCardPayment';
$route['getDateFromServer'] = 'api_controller/getDateFromServer';
$route['getRates'] = 'api_controller/getRates';

//Login - Logout Routes
$route['(:any)/login'] = 'login_controller';
$route['(:any)/verifyLogin'] = 'login_controller/verify';

/* ------------------------------------------------------------------- */
//Pages Routes
$route['escazu/galeria'] = 'pages_controller/escazu_gallery';
$route['desamparados/galeria'] = 'pages_controller/desamparados_gallery';
$route['(:any)/accesoDenegado'] = 'pages_controller/access_denied';
$route['logout'] = 'admin_controller/logout';


/* End of file routes.php */
/* Location: ./application/config/routes.php */