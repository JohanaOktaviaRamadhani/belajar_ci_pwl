<?= $this->extend('layout') ?>
<?= $this->section('content') ?>

<div class="row">
    <div class="col-lg-6">
        <?= form_open('buy', ['class' => 'row g-3']) ?>
        <?= form_hidden('username', session()->get('username')) ?>
        <?= form_input(['type' => 'hidden', 'name' => 'total_harga', 'id' => 'total_harga', 'value' => '']) ?>

        <div class="col-12">
            <label for="nama" class="form-label">Nama</label>
            <input type="text" class="form-control" id="nama" value="<?= session()->get('username'); ?>" readonly>
        </div>
        <div class="col-12">
            <label for="alamat" class="form-label">Alamat</label>
            <input type="text" class="form-control" id="alamat" name="alamat" required>
        </div>
        <div class="col-12">
            <label for="kelurahan" class="form-label">Kelurahan</label>
            <select class="form-control" name="kelurahan" id="kelurahan" required></select>
        </div>
        <div class="col-12">
            <label for="layanan" class="form-label">Layanan</label>
            <select class="form-control" name="layanan" id="layanan" required></select>
        </div>
        <div class="col-12">
            <label for="ongkir" class="form-label">Ongkir</label>
            <input type="text" class="form-control" id="ongkir" name="ongkir" readonly>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="col-12">
            <table class="table">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $total_diskon = 0;
                    if (!empty($items)) :
                        foreach ($items as $item) :
                            $harga_asli = $item['price'] + (session('diskon_nominal') ?? 0);
                            $harga_diskon = $item['price'];
                            $sub_total = $harga_diskon * $item['qty'];
                            $diskon_item = (session('diskon_nominal') ?? 0) * $item['qty'];
                            $total_diskon += $diskon_item;
                    ?>
                            <tr>
                                <td><?= $item['name'] ?></td>
                                <td>
                                    <?php if (session()->has('diskon_nominal')) : ?>
                                        <small class="text-muted text-decoration-line-through">
                                            <?= number_to_currency($harga_asli, 'IDR') ?>
                                        </small><br>
                                        <strong><?= number_to_currency($harga_diskon, 'IDR') ?></strong>
                                    <?php else : ?>
                                        <?= number_to_currency($harga_diskon, 'IDR') ?>
                                    <?php endif; ?>
                                </td>
                                <td><?= $item['qty'] ?></td>
                                <td><?= number_to_currency($sub_total, 'IDR') ?></td>
                            </tr>
                    <?php
                        endforeach;
                    endif;
                    ?>
                    <tr>
                        <td colspan="3" class="text-end">Subtotal</td>
                        <td><?= number_to_currency($total, 'IDR') ?></td>
                    </tr>
                    <?php if (session()->has('diskon_nominal')) : ?>
                        <tr>
                            <td colspan="3" class="text-end text-danger">Total Diskon</td>
                            <td class="text-danger">-<?= number_to_currency($total_diskon, 'IDR') ?></td>
                        </tr>
                    <?php endif; ?>
                    <tr>
                        <td colspan="3" class="text-end">Ongkir</td>
                        <td id="ongkir_view">Rp0</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-end fw-bold">Total Bayar</td>
                        <td><span id="total"><?= number_to_currency($total, 'IDR') ?></span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Buat Pesanan</button>
        </div>
        <?= form_close() ?>
    </div>
</div>

<?= $this->endSection() ?>

<?= $this->section('script') ?>
<script>
    $(document).ready(function() {
        let ongkir = 0;
        let total = <?= $total ?>;

        hitungTotal();

        $('#kelurahan').select2({
            placeholder: 'Ketik nama kelurahan...',
            ajax: {
                url: '<?= base_url('get-location') ?>',
                dataType: 'json',
                delay: 1500,
                data: function(params) {
                    return {
                        search: params.term
                    };
                },
                processResults: function(data) {
                    return {
                        results: data.map(item => ({
                            id: item.id,
                            text: ${item.subdistrict_name}, ${item.district_name}, ${item.city_name}, ${item.province_name}, ${item.zip_code}
                        }))
                    };
                },
                cache: true
            },
            minimumInputLength: 3
        });

        $('#kelurahan').on('change', function() {
            const id_kelurahan = $(this).val();
            $('#layanan').empty();
            ongkir = 0;

            $.ajax({
                url: '<?= site_url('get-cost') ?>',
                type: 'GET',
                data: { destination: id_kelurahan },
                dataType: 'json',
                success: function(data) {
                    data.forEach(item => {
                        const text = ${item.description} (${item.service}) : estimasi ${item.etd};
                        $('#layanan').append($('<option>', {
                            value: item.cost,
                            text: text
                        }));
                    });
                    hitungTotal();
                }
            });
        });

        $('#layanan').on('change', function() {
            ongkir = parseInt($(this).val());
            hitungTotal();
        });

        function hitungTotal() {
            const grand_total = total + ongkir;
            $('#ongkir').val(ongkir);
            $('#ongkir_view').text("IDR " + ongkir.toLocaleString());
            $('#total').text("IDR " + grand_total.toLocaleString());
            $('#total_harga').val(grand_total);
        }
    });
</script>
<?= $this->endSection() ?>