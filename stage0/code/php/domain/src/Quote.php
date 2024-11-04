<?php

declare(strict_types=1);

/*
 * This file is part of the Quote.sketch package.
 *
 * (c) Katarzyna Krasińska <katheroine@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

 namespace Katheroine\Quote;

 use Katheroine\Quote\Author;
 use Katheroine\Quote\Source;

 /**
  * Quote.
  *
  * @package Quote
  * @author Katarzyna Krasińska <katheroine@gmail.com>
  * @copyright Copyright (c) 2024 Katarzyna Krasińska
  * @license http://opensource.org/licenses/MIT MIT License
  * @link https://github.com/katheroine/quote.sketch
  */
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
