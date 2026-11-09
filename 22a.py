#level intermediate
import pytest

print("Hello")

def gadget_cost(num_gadgets: int, label: str) -> float:
    """ 
    computes cost, $0.50 per gadget, with $0.05 per letter
    """
    return num_gadgets * (0.50 + 0.05 * len(label))

def test_gadget_cost_small():
    assert gadget_cost(1, "hi") == pytest.approx(0.6)

def test_gadget_cost_small2():
    assert gadget_cost(2, "a") == pytest.approx(1.1)

def test_float():
    assert 0.1 + 0.2 == pytest.approx(0.3)

def if_test():
    if 10 < 20:
        return 20
    elif 30 > 40:
        return 30
    else:
        return 40


def greet(name: str) -> str:
    """ produces Hello, name! """
    return "Hello, " + name + "!"

def test_greet():
    assert greet("Alice") == "Hello, Alice!"
    assert greet("Bob") == "Hello, Bob!"

def greet_age(name: str, age: int) -> str:
    """ produces name is age years old """
    return name + " is " + str(age) + " years old."

def test_greet_age():
    assert greet_age("Alice", 20) == "Alice is 20 years old."

def shipping_cost(weight: int) -> int:
    """ if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $20 """
    if weight <= 1:
       return 5
    elif weight <= 5:
        return 10
    else:
        return 20

def test_shipping_cost():
    assert shipping_cost(1) == 5