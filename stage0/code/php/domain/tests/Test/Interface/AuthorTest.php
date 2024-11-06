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

 namespace Katheroine\Quote\Test\Interface;

 use PHPUnit\Framework\TestCase;
 use Katheroine\Quote\Author;

 /**
  * @package Quote
  * @author Katarzyna Krasińska <katheroine@gmail.com>
  * @copyright Copyright (c) 2024 Katarzyna Krasińska
  * @license http://opensource.org/licenses/MIT MIT License
  * @link https://github.com/katheroine/quote.sketch
  */
class AuthorTest extends TestCase
{
    const AUTHOR_FULLY_QUALIFIED_CLASS_NAME = 'Katheroine\Quote\Author';

    public function testAuthorClassExists()
    {
        $this->assertTrue(
            class_exists(self::AUTHOR_FULLY_QUALIFIED_CLASS_NAME)
        );
    }

    public function testConstructorWhenPennameIsNotString()
    {
        $this->expectException('\TypeError');

        $penname = 1024;

        new Author($penname);
    }

    // Domain constraint
    public function testConstructorWhenPennameIsEmptyString()
    {
        $this->expectException('\InvalidArgumentException');
        $this->expectExceptionMessageMatches('/[P|p]enname/');

        $penname = "";

        new Author($penname);
    }

    /**
     * @dataProvider properPennamesProvider
     */
    public function testConstructorWhenPennameIsNonEmptyString(string $penname)
    {
        $author = new Author($penname);

        $this->assertSame($penname, $author->penname);
    }

    public function testGetPennameFunctionExists()
    {
        $this->assertTrue(
            method_exists(
                self::AUTHOR_FULLY_QUALIFIED_CLASS_NAME,
                'getPenname'
            )
        );
    }

    /**
     * @dataProvider properPennamesProvider
     */
    public function testGetPennameFunctionReturnsPenname(string $expectedPenname)
    {
        $author = new Author($expectedPenname);

        $actualPenname = $author->getPenname();

        $this->assertEquals($expectedPenname, $actualPenname);
    }

    /**
     * Provide file paths
     * and appropriate extension.
     *
     * @return array
     */
    public static function properPennamesProvider(): array
    {
        return [
            ['Carotella Pumpkinwood'],
            ['The Pumpernikel'],
            ['h4x0r'],
            ['1984'],
            ['Hi, my name is Gusto'],
            ["And he's name is 40 & 4"]
        ];
    }
}
