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

$route['default_controller'] = "home_controller";
$route['404_override'] = '';

//Reservaciones Routs
$route['(:any)/reservaciones'] = 'calendar_controller/calendar/';
$route['reservaciones/(:num)/(:any)'] = 'calendar_controller/calendar/$1/$2';
$route['reservaciones/(:any)'] = 'calendar_controller/$1';

//Admin Routes
$route['(:any)/admin'] = 'calendar_controller/admin/';
$route['admin/(:num)/(:any)'] = 'calendar_controller/admin/$1/$2';
$route['admin/(:any)'] = 'calendar_controller/$1';

//Services Routs
$route['getReservationByDay'] = 'calendar_controller/getReservationByDay';

//Login - Logout Routes
$route['login'] = 'login_controller';
$route['logout'] = 'admin_controller/logout';

/* End of file routes.php */
/* Location: ./application/config/routes.php */