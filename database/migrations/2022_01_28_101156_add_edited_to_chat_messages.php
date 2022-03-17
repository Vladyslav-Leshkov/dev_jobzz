<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddEditedToChatMessages extends Migration
{
    public function up()
    {
        Schema::table('chat_messages', function (Blueprint $table) {
            //
            $table->boolean('edited')->default(0)->after('seen');
        });
    }

    public function down()
    {
        Schema::table('chat_messages', function (Blueprint $table) {
            //
            $table->dropColumn('edited');
        });
    }
}