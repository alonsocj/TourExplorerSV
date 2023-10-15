<?php 

  return [
    'default' => $_ENV['DB_CONNECTION'] ?? 'mysql',
    'connections' => [
      'mysql' => [
        'driver' => 'mysql',
        'host' => $_HOST['DB_HOST'] ?? 'localhost',
        'port' => $_HOST['DB_PORT'] ?? '3306',
        'database' => $_HOST['DB_DATABASE'] ?? 'toursexplorersv',
        'username' => $_HOST['DB_USERNAME'] ?? 'root',
        'password' => $_HOST['DB_PASSWORD'] ?? '',
        'charset' => 'utf8mb4',
        'collation' => 'utf8mb4_unicode_ci',
      ],
    ],
  ];