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
class SourceTest extends TestCase
{
    const SOURCE_FULLY_QUALIFIED_CLASS_NAME = 'Katheroine\Quote\Source';

    /**
     * Test if Source class
     * has been created.
     */
    public function testSourceClassExists()
    {
        $this->assertTrue(
            class_exists(self::SOURCE_FULLY_QUALIFIED_CLASS_NAME)
        );
    }
}
