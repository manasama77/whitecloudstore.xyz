<?php
defined('BASEPATH') or exit('No direct script access allowed');
$route['default_controller'] = 'admin';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

// API routing
$route['api/level/get']     = 'api_level/get';
$route['api/level/destroy'] = 'api_level/destroy';
