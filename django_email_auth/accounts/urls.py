from django.urls import path
from .views import CustomLoginView, CustomLogoutView, SignUpView, EmailVerificationView

urlpatterns = [
    path('login/', CustomLoginView.as_view(), name='login'),
    path('logout/', CustomLogoutView.as_view(), name='logout'),
    path('signup/', SignUpView.as_view(), name='signup'),
    path('verify/<uidb64>/<token>/', EmailVerificationView.as_view(), name='email_verify'),
]