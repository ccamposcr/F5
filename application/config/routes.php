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

$route['default_controller'] = "calendar_controller";
$route['404_override'] = '';
$route['reservaciones'] = 'calendar_controller/calendar/';
$route['reservaciones/(:num)/(:any)'] = 'calendar_controller/calendar/$1/$2';
//$route['calendar/(:num)/(:num)/'] = 'calendar_controller/calendar/$1/$2';
//$route['getReservationByTime'] = 'calendar_controller/getReservationByTime';
$route['getReservationByDay'] = 'calendar_controller/getReservationByDay';
$route['reservaciones/(:any)'] = 'calendar_controller/$1';
$route['login'] = 'login_controller';
$route['logout'] = 'admin_controller/logout';

//Admin Routes
$route['admin/reservaciones/(:any)'] = 'calendar_controller/$1';
$route['admin/reservaciones'] = 'calendar_controller/calendar';


/* End of file routes.php */
/* Location: ./application/config/routes.php */