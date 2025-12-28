"""Example Python file for LSP testing."""

from dataclasses import dataclass


@dataclass
class User:
    """A user in the system."""

    name: str
    email: str
    age: int

    def greet(self) -> str:
        """Return a greeting message."""
        return f"Hello, {self.name}!"


def create_user(name: str, email: str, age: int) -> User:
    """Create a new user instance."""
    return User(name=name, email=email, age=age)


def main() -> None:
    """Entry point."""
    user = create_user("Alice", "alice@example.com", 30)
    message = user.greet()
    print(message)


if __name__ == "__main__":
    main()
