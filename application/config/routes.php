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
$route['desamparados/reservaciones'] = 'calendar_controller/calendar/';
$route['desamparados/reservaciones/(:num)/(:any)'] = 'calendar_controller/calendar/$1/$2';
$route['desamparados/reservaciones/(:any)'] = 'calendar_controller/$1';

//Escazu
$route['escazu/reservaciones'] = 'calendar_controller/calendar/';
$route['escazu/reservaciones/(:num)/(:any)'] = 'calendar_controller/calendar/$1/$2';
$route['escazu/reservaciones/(:any)'] = 'calendar_controller/$1';

/*  ------------------------------------------------------------------ */

//Admin Routes

//Desamparados
$route['desamparados/admin'] = 'calendar_controller/admin/';
$route['desamparados/admin/(:num)/(:any)'] = 'calendar_controller/admin/$1/$2';
$route['desamparados/admin/(:any)'] = 'calendar_controller/$1';

//Escazu
$route['escazu/admin'] = 'calendar_controller/admin/';
$route['escazu/admin/(:num)/(:any)'] = 'calendar_controller/admin/$1/$2';
$route['escazu/admin/(:any)'] = 'calendar_controller/$1';

/* ------------------------------------------------------------------- */

//Services Routs
$route['getReservationByDay'] = 'calendar_controller/getReservationByDay';
$route['(:any)/getReservationByDay'] = 'calendar_controller/getReservationByDay';

//Login - Logout Routes
//Escazu
$route['escazu/login'] = 'login_controller';

$route['escazu/verifyLogin'] = 'login_controller/verify';
$route['escazu/verifyLogin'] = 'login_controller/verify';

//Desamparados
$route['desamparados/login'] = 'login_controller';

$route['desamparados/verifyLogin'] = 'login_controller/verify';
$route['desamparados/verifyLogin'] = 'login_controller/verify';

/* ------------------------------------------------------------------- */
//Pages Routes
$route['escazu'] = 'pages_controller/f5_escazu';
$route['desamparados'] = 'pages_controller/f5_desamparados';
$route['logout'] = 'admin_controller/logout';


/* End of file routes.php */
/* Location: ./application/config/routes.php */