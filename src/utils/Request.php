<?php

declare(strict_types=1);

function parameter(string $field): string 
{
    return htmlspecialchars($_POST[$field]  ?? $_GET[$field]);
}
