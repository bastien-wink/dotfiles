<?php

$config = PhpCsFixer\Config::create()
    ->setRules([
        'no_extra_blank_lines' => true,
        'array_indentation' => true,
        'blank_line_before_statement' => true,
        'ternary_to_null_coalescing' => true,
        'concat_space' => ['spacing' => 'none'],
        'array_syntax' => ['syntax' => 'short'],
        '@Symfony' => true,
    ]);

return $config;
