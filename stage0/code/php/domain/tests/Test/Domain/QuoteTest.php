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

namespace Katheroine\Quote\Test\Domain;

use PHPUnit\Framework\TestCase;
use Katheroine\Quote\Author;
use Katheroine\Quote\Source;
use Katheroine\Quote\Quote;

/**
 * @package Quote
 * @author Katarzyna Krasińska <katheroine@gmail.com>
 * @copyright Copyright (c) 2024 Katarzyna Krasińska
 * @license http://opensource.org/licenses/MIT MIT License
 * @link https://github.com/katheroine/quote.sketch
 */
class QuoteTest extends TestCase
{
    const QUOTE_FULLY_QUALIFIED_CLASS_NAME = 'Katheroine\Quote\Quote';

    /**
     * Instance of tested class.
     *
     * @var Quote
     */
    private Quote $quote;

    public function testAssignAuthorWhenCompliantWithSource()
    {
        $author1 = new Author;
        $author1->penname = 'Penelope Lopez';
        $author2 = new Author;
        $author2->penname = 'Hermione Rizone';

        $source = new Source;
        $source->assignAuthor($author1);
        $source->assignAuthor($author2);

        $this->quote->assignSource($source);

        $this->quote->assignAuthor($author1);
    }

    public function testAssignAuthorWhenNotCompliantWithSource()
    {
        $author1 = new Author;
        $author1->penname = 'Penelope Lopez';
        $author2 = new Author;
        $author2->penname = 'Hermione Rizone';

        $source = new Source;
        $source->assignAuthor($author1);
        $source->assignAuthor($author2);

        $this->quote->assignSource($source);

        $author3 = new Author;
        $author3->penname = 'Alma Habalma';

        $this->expectException('\Exception');
        $this->quote->assignAuthor($author3);
    }

    /**
     * Sets up the fixture, for example, open a network connection.
     * This method is called before a test is executed.
     *
     * @return void
     */
    protected function setUp(): void
    {
        $this->quote = new Quote();
    }
}
