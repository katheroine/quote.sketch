<?php

declare(strict_types=1);

require_once('Author.php');
require_once('Source.php');

class Quote
{
    private array $authors;
    private Source $source;

    public function assignAuthor(Author $author)
    {
        $this->authors[] = $author;
    }

    public function assignSource(Source $source)
    {
        $this->source = $source;
    }
}
