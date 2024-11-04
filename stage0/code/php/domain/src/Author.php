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
    public string $penname; // TODO Should the uniqueness be checked here and how if so?
}
