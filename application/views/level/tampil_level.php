<?php $this->load->view('template/header'); ?>
<!-- AWAL MAIN-->
<main class="main">
  <!-- Breadcrumb-->
  <ol class="breadcrumb">
    <li class="breadcrumb-item">Home</li>
    <li class="breadcrumb-item">
      <a href="#">Admin</a>
    </li>
    <li class="breadcrumb-item active">Tampil Level</li>
    <!-- Breadcrumb Menu-->
    <li class="breadcrumb-menu d-md-down-none">
      <div class="btn-group" role="group" aria-label="Button group">
        <a class="btn" href="#">
          <i class="icon-speech"></i>
        </a>
      </div>
    </li>
  </ol>
  <div class="container-fluid">
    <p contenteditable="true" spellcheck="check">Test</p>
    <div class="animated fadeIn">
      <!-- AWALAN KODING-->
      <h1>Tampilan Data level</h1>
      <?php echo anchor('admin/formlevel', 'Tambah Level', array('class' => 'btn btn-danger my-4')) ?>
      <br />
      <?php if ($this->session->flashdata('info')) { ?>
        <div class="alert alert-danger" role="alert">
          <?php echo $this->session->flashdata('info') ?>
        </div>
      <?php } ?>

      <div class="card text-left">
        <div class="card-body">
          <table class="table table-responsive-sm table-hover table-outline mb-0">
            <thead class="thead-light">
              <tr>
                <th class="text-center">NO</th>
                <th class="text-center">Level</th>
                <th class="text-center">Action</th>
              </tr>
            </thead>
            <tbody id="vdata"></tbody>
          </table>
        </div>
      </div>
      <!-- AKHIR KODING-->

    </div>
  </div>
</main>
<!-- AKHIR MAIN-->
<?php $this->load->view('template/footer'); ?>

<script>
  $(document).ready(() => {
    // AJAX untuk mengambil data MENU
    $.ajax({
      url: '<?= site_url('api/level/get'); ?>',
      type: 'GET',
      dataType: "JSON",
      beforeSend: () => {
        $('#vdata').block({
          message: '<i class="fas fa-spinner fa-spin"></i>'
        })
      },
    }).always(() => {
      $('#vdata').unblock()
    }).fail(e => {
      alert("Gagal Mendapatkan Data Menu")
      $('#vdata').unblock()
    }).done(e => {
      console.table(e.data)
      let htmlnya = '';
      if (e.length == 0) {
        htmlnya = `<tr><th colspan="3" class="text-center text-danger">Tidak ada data</th></tr>`
      } else {
        let itteration = 1
        $.each(e.data, (i, k) => {
          htmlnya += `
          <tr>
            <td class="text-center">${itteration}</td>
            <td class="text-center">${k.nama_level}</td>
            <td class="text-center">
              <div class="btn-group">
              <button type="button" class="btn btn-danger" onclick="deleteData(${k.id_level}, '${k.nama_level}')">
                Hapus
              </button>
              <a href="<?= site_url(); ?>admin/formeditlevel/${k.id_level}" class="btn btn-success">
                Edit
              </a>
            </td>
          </tr>`

          itteration++
        })
      }
      $('#vdata').html(htmlnya)
    })
  })


  function deleteData(id, nama) {
    Swal.fire({
      title: `Delete Data ${nama}?`,
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        // AJAX untuk mengambil data MENU
        $.ajax({
          url: '<?= site_url('api/level/destroy'); ?>',
          type: 'POST',
          dataType: "JSON",
          data: {
            id: id
          },
          beforeSend: () => {
            $('#vdata').block({
              message: '<i class="fas fa-spinner fa-spin"></i>'
            })
          },
        }).always(() => {
          $('#vdata').unblock()
        }).fail(e => {
          Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Failed get data Menu',
            showConfirmButton: false,
            timer: 5000,
            toast: true
          }).then(() => {
            $('#vdata').unblock()
          })
        }).done(e => {
          if (e.code == 200) {
            pushNotif("Delete Data Success")
          } else {
            pushNotif("Delete Data Failed")
          }
        })
      }
    })
  }

  // function untuk menampilkan notification
  function pushNotif(msg) {
    Push.create("2021 UTS", {
      body: msg,
      icon: "<?= base_url('asset/img/coreui.png'); ?>",
      timeout: 10000,
      onClick: function() {
        window.focus()
        pushClose()
      },
      onClose: function() {
        window.location.reload()
      }
    })
  }

  // function untuk menutup notification
  function pushClose() {
    Push.clear()
  }
</script>