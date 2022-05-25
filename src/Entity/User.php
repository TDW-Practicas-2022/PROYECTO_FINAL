<?php

/**
 * src/Entity/User.php
 *
 * @license https://opensource.org/licenses/MIT MIT License
 * @link    http://www.etsisi.upm.es/ ETS de Ingeniería de Sistemas Informáticos
 */

namespace TDW\ACiencia\Entity;

use Cake\Chronos\Date;
use Doctrine\ORM\Mapping as ORM;
use JsonSerializable;
use phpDocumentor\Reflection\Types\Boolean;
use UnexpectedValueException;;

/**
 * @ORM\Entity()
 * @ORM\Table(
 *     name                 = "user",
 *     uniqueConstraints    = {
 *          @ORM\UniqueConstraint(
 *              name="IDX_UNIQ_USERNAME", columns={ "username" }
 *          ),
 *          @ORM\UniqueConstraint(
 *              name="IDX_UNIQ_EMAIL", columns={ "email" }
 *          )
 *      }
 *     )
 */
class User implements JsonSerializable
{
    /**
     * @ORM\Column(
     *     name     = "id",
     *     type     = "integer",
     *     nullable = false
     *     )
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected int $id;

    /**
     * @ORM\Column(
     *     name     = "username",
     *     type     = "string",
     *     length   = 32,
     *     unique   = true,
     *     nullable = false
     *     )
     */
    protected string $username;

    /**
     * @ORM\Column(
     *     name     = "email",
     *     type     = "string",
     *     length   = 60,
     *     unique   = true,
     *     nullable = false
     *     )
     */
    protected string $email;

    /**
     * @ORM\Column(
     *     name     = "password",
     *     type     = "string",
     *     length   = 60,
     *     nullable = false
     *     )
     */
    protected string $password_hash;

    /**
     * @ORM\Embedded(
     *     class="TDW\ACiencia\Entity\Role"
     * )
     */
    protected Role $role;

    /**
     * @ORM\Column(
     *     name     = "realname",
     *     type     = "string",
     *     length   = 60,
     *     unique   = false,
     *     nullable = true
     *     )
     */
    protected string|null $realname;

    /**
     * @ORM\Column(
     *     name     = "birthDate",
     *     type     = "string",
     *     length   = 60,
     *     unique   = false,
     *     nullable = true
     *     )
     */
    protected string|null $birthDate;

    /**
     * @ORM\Column(
     *     name     = "isActive",
     *     type     = "boolean"
     *     )
     */
    protected bool $isActive;

    /**
     * User constructor.
     *
     * @param string $username username
     * @param string $email email
     * @param string $password password
     * @param string $role Role::ROLE_READER | Role::ROLE_WRITER
     * @param string|null $realname realname
     * @param string|null $birthDate birthDate
     * @param bool $isActive isActive
     *
     */
    public function __construct(
        string $username = '',
        string $email = '',
        string $password = '',
        string $role = Role::ROLE_READER,
        string|null $realname = null,
        string|null $birthDate = null,
        bool $isActive = null
    ) {
        $this->id       = 0;
        $this->username = $username;
        $this->realname = $realname;
        $this->email    = $email;
        $this->setPassword($password);
        try {
            $this->setRole($role);
        } catch (UnexpectedValueException) {
            throw new UnexpectedValueException('Unexpected Role');
        }
        $this->realname = $realname;
        $this->birthDate = $birthDate;
        $this->isActive = $isActive;
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * Get username
     *
     * @return string
     */
    public function getUsername(): string
    {
        return $this->username;
    }

    /**
     * Set username
     *
     * @param string $username username
     * @return void
     */
    public function setUsername(string $username): void
    {
        $this->username = $username;
    }

    /**
     * Get realname
     *
     * @return string
     */
    public function getRealname(): string|null
    {
        return $this->realname;
    }

    /**
     * Set realname
     *
     * @param string|null $realname realname
     * @return void
     */
    public function setRealname(string|null $realname): void
    {
        $this->realname = $realname;
    }

    /**
     * @return string|null
     */
    public function getBirthDate(): string|null
    {
        return $this->birthDate;
    }

    /**
     * @param string|null $birthDate
     */
    public function setBirthDate(string|null $birthDate): void
    {
        $this->birthDate = $birthDate;
    }

    /**
     * @return bool
     */
    public function getIsActive(): bool
    {
        return $this->isActive;
    }

    /**
     * @param bool $isActive
     */
    public function setIsActive(bool $isActive): void
    {
        $this->isActive = $isActive;
    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email email
     * @return void
     */
    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    /**
     * @param string $role
     * @return boolean
     */
    public function hasRole(string $role): bool
    {
        return $this->role->hasRole($role);
    }

    /**
     * @param string $role [ Role::ROLE_READER | Role::ROLE_WRITER ]
     * @throws UnexpectedValueException
     * @return void
     */
    public function setRole(string $role): void
    {
        // Object types are compared by reference, not by value.
        // Doctrine updates this values if the reference changes and therefore
        // behaves as if these objects are immutable value objects.
        $this->role = new Role($role);
    }

    /**
     * @return array ['reader'] | ['reader', 'writer']
     */
    public function getRoles(): array
    {
        $roles = array_filter(
            Role::ROLES,
            fn($myRole) => $this->hasRole($myRole)
        );

        return $roles;
    }

    /**
     * Get the hashed password
     *
     * @return string
     */
    public function getPassword(): string
    {
        return $this->password_hash;
    }

    /**
     * @param string $password password
     * @return void
     */
    public function setPassword(string $password): void
    {
        $this->password_hash = strval(password_hash($password, PASSWORD_DEFAULT));
    }

    /**
     * Verifies that the given hash matches the user password.
     *
     * @param string $password password
     * @return boolean
     */
    public function validatePassword(string $password): bool
    {
        return password_verify($password, $this->password_hash);
    }

    /**
     * The __toString method allows a class to decide how it will react when it is converted to a string.
     *
     * @return string
     * @link http://php.net/manual/en/language.oop5.magic.php#language.oop5.magic.tostring
     */
    public function __toString(): string
    {
        return
            sprintf(
                '[%s: (id=%04d, username="%s", realname="%s", birthDate="%s", isActive="%b", email="%s", role="%s")]',
                basename(self::class),
                $this->getId(),
                $this->getUsername(),
                $this->getRealname(),
                $this->getBirthDate(),
                $this->getIsActive(),
                $this->getEmail(),
                $this->role
            );
    }

    /**
     * Specify data which should be serialized to JSON
     * @link http://php.net/manual/en/jsonserializable.jsonserialize.php
     * @return array data which can be serialized by <b>json_encode</b>,
     * which is a value of any type other than a resource.
     * @since 5.4.0
     */
    public function jsonSerialize(): array
    {
        return [
            'user' => [
                'id' => $this->getId(),
                'username' => $this->getUsername(),
                'realname' => $this->getRealname(),
                'birthDate' => $this->getBirthDate(),
                'isActive' => $this->getIsActive(),
                'email' => $this->getEmail(),
                'role' => $this->role->__toString(),
            ]
        ];
    }
}
