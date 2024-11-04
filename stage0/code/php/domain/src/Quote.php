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

use Exception;
use Katheroine\Quote\Author;
 use Katheroine\Quote\Source;

 /**
  * Quote.
  * Aggregate.
  *
  * @package Quote
  * @author Katarzyna Krasińska <katheroine@gmail.com>
  * @copyright Copyright (c) 2024 Katarzyna Krasińska
  * @license http://opensource.org/licenses/MIT MIT License
  * @link https://github.com/katheroine/quote.sketch
  */
class Quote
{
    /**
     * Authors of the Quote.
     * Quote can have none, one or many Authors.
     * They can be Authors of the related Source
     * or only a subset of those Authors.
     */
    private array $authors;

    /**
     * Source of the Quote.
     * Quote can have none or only one Source.
     */
    private ?Source $source = null;

    /**
     * @param Author $author
     *
     * @return void
     */
    public function assignAuthor(Author $author)
    {
        $this->validateAuthor($author);
        $this->authors[] = $author;
    }

    /**
     * @param Source $source
     *
     * @return void
     */
    public function assignSource(Source $source)
    {
        $this->source = $source;
    }

    /**
     * @throws \Exception;
     */
    private function validateAuthor(Author $author)
    {
        if (is_null($this->source))
        {
            return;
        }

        foreach ($this->source->authors as $sourceAuthor) {
            if ($sourceAuthor === $author) {
                return;
            }
        }

        throw new \Exception('Author not present in the assigned source');
    }
}
