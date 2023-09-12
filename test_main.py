import pytest

from main import app


@pytest.fixture
def client():
    client = app.test_client()
    return client


def test_index(client):
    response = client.get("/cow")
    assert response.status_code == 200


    


   


