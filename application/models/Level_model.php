<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Level_model extends CI_Model
{

    public function get()
    {
        $this->db->order_by('id_level', 'asc');
        return $this->db->get('level');
    }

    public function destroy($id)
    {
        $this->db->where('id_level', $id);
        return $this->db->delete('level');
    }
}
                        
/* End of file level_model.php */
