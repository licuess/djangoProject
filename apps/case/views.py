from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from rest_framework.response import Response
from rest_framework.views import APIView


class TestCaseView(APIView):
    @swagger_auto_schema(
        operation_description="test case api for get",
        request_body=None,
        manual_parameters=[
            openapi.Parameter('id', openapi.IN_QUERY, "id", type=openapi.TYPE_STRING)
        ],
        security=[],
        tags=["test case"],
    )
    def get(self, request):
        return Response({"request": "hello", "code": 200})