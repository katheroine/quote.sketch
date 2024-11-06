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

 /**
  * Author of the Sources and Quotes.
  * Entity.
  *
  * @package Quote
  * @author Katarzyna Krasińska <katheroine@gmail.com>
  * @copyright Copyright (c) 2024 Katarzyna Krasińska
  * @license http://opensource.org/licenses/MIT MIT License
  * @link https://github.com/katheroine/quote.sketch
  */
class Author
{
    /**
     * Author's penname present in the related content and sources metadata.
     *
     * @var string
     */
    public string $penname; // unique
    /**
     * @param string $penname
     */
    public function __construct(string $penname)
    {
        $this->validatePenname($penname);
        $this->penname = $penname;
    }

    /**
     * @return string
     */
    public function getPenname(): string
    {
        return $this->penname;
    }

    /**
     * @param string $penname
     *
     * @return void
     *
     * @throws \InvalidArgumentException
     */
    private static function validatePenname(string $penname): void
    {
        if (empty($penname)) {
            throw new \InvalidArgumentException(
                'Penname cannot be empty.'
            );
        }
    }
}
