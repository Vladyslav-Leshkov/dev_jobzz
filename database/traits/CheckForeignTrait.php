<?php

namespace Database\Traits;

use Illuminate\Support\Facades\Schema;

trait CheckForeignTrait
{
    public function foreignExist($table, $key)
    {
        return in_array($key, $this->listTableForeignKeys($table));
    }

    public function listTableForeignKeys($table)
    {
        $conn = Schema::getConnection()->getDoctrineSchemaManager();

        return array_map(function ($key) {
            return $key->getName();
        }, $conn->listTableForeignKeys($table));
    }
}
