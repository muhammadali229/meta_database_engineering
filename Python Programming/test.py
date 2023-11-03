import pytest
import to_be_tested as f

def test_add():
    assert f.add(5, 3) == 8

def test_sub():
    assert f.sub(5, 3) == 2