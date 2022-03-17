<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPushColumnToNotifySettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('notify_settings', function (Blueprint $table) {
            //
            $table->boolean('push_notify')->default(0)->after('email_notify');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('notify_settings', function (Blueprint $table) {
            //
            $table->dropColumn('push_notify');
        });
    }
}
