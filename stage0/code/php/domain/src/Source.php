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
  * Source of the Quotes.
  * Entity.
  *
  * @package Quote
  * @author Katarzyna Krasińska <katheroine@gmail.com>
  * @copyright Copyright (c) 2024 Katarzyna Krasińska
  * @license http://opensource.org/licenses/MIT MIT License
  * @link https://github.com/katheroine/quote.sketch
  */
class Source
{
    /**
     * Source's title.
     * Not obligatory.
     *
     * @var string
     */
    public string $title;

    /**
     * Source's description.
     * Not obligatory but only if title is defined.
     * It is especially important for sources without title
     * because in such cases, description allows to tell something about the specific source
     * e.g. it was a spontaneous speech, a note or an social media post.
     *
     * @var string
     */
    public string $description;

    /**
     * Authors of the Source.
     * Source can have none, one or many Authors.
     */
    public array $authors;

    /**
     * @param Author $author
     *
     * @return void
     */
    public function assignAuthor(Author $author)
    {
        $this->authors[] = $author;
    }
}
