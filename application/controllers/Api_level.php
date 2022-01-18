<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Api_level extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
        $this->load->model('Level_model', 'level_model');
    }


    public function get()
    {
        $exec = $this->level_model->get();
        echo json_encode(['data' => $exec->result()]);
    }

    public function destroy()
    {
        $id = $this->input->post('id');
        $exec = $this->level_model->destroy($id);
        $code = 500;
        if ($exec) {
            $code = 200;
        }

        echo json_encode(['code' => $code]);
    }
}
        
    /* End of file  api_level.php */
