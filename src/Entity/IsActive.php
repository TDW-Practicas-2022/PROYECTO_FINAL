<?php

/**
 * src/Entity/IsActive.php
 *
 * @license https://opensource.org/licenses/MIT MIT License
 * @link    http://www.etsisi.upm.es/ ETS de Ingeniería de Sistemas Informáticos
 */

namespace TDW\ACiencia\Entity;

use Doctrine\ORM\Mapping as ORM;
use JsonSerializable;
use UnexpectedValueException;

/**
 * Class IsActive
 *
 * @ORM\Embeddable
 */
class IsActive implements JsonSerializable
{
    // scope names
    public const ACTIVE = 'active';
    public const INACTIVE = 'inactive';
    public const STATUS = [
        1 => self::ACTIVE,
        0 => self::INACTIVE,
    ];

    /**
     * @ORM\Column(
     *     name="value",
     *     type="smallint"
     * )
     */
    private int $isActive;

    /**
     * isActive constructor.
     * @param string $isActive
     * @throws UnexpectedValueException
     */
    public function __construct(string $isActive = self::ACTIVE)
    {
        $this->setIsActive($isActive);
    }

    /**
     * @param string $isActive [ IsActive::ACTIVE | IsActive::INACTIVE ]
     * @return void
     */
    protected function setIsActive(string $isActive): void
    {
        $isActive = strtolower($isActive);
        if (!in_array($isActive, self::STATUS, true)) {
            throw new UnexpectedValueException('Unexpected Status');
        }
        $this->isActive = (int) array_search($isActive, self::STATUS);
    }

    /**
     * @param string $isActive
     *
     * @return bool
     */
    public function hasIsActive(string $isActive): bool
    {
        return match (strtolower($isActive)) {
            self::ACTIVE => true,
            self::INACTIVE => (self::STATUS[$this->isActive] === self::INACTIVE),
            default => false
        };
    }

    /**
     * The __toString method allows a class to decide how it will react when it is converted to a string.
     *
     * @return string
     * @link https://php.net/manual/en/language.oop5.magic.php#language.oop5.magic.tostring
     */
    public function __toString(): string
    {
        return self::STATUS[$this->isActive];
    }

    /**
     * @inheritDoc
     * @codeCoverageIgnore
     */
    public function jsonSerialize(): array
    {
        return [
            'isActive' => $this->__toString()
        ];
    }
}
