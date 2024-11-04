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

 use PHPUnit\Framework\TestCase;

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
     * Test if Quote class
     * has been created.
     */
    public function testQuoteClassExists()
    {
        $this->assertTrue(
            class_exists(self::QUOTE_FULLY_QUALIFIED_CLASS_NAME)
        );
    }
}
