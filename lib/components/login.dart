import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'home.dart';

const loginPink = Color(0xFFE91E63);
const loginText = Color(0xFF171B26);
const loginMuted = Color(0xFF8A8D96);

const _font = 'Poppins'; // Asegúrate de tener 'Poppins' declarada en pubspec.yaml

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ============================================================
  // INICIAR SESIÓN
  // ============================================================

  void _iniciarSesion() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor completa el correo y la contraseña.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F2F4),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(29, 32, 29, 28),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFDFE),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 24,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // LOGO
                  _logo(),
                  const SizedBox(height: 16),

                  const Text(
                    'Elegance',
                    style: TextStyle(
                      fontFamily: _font,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: loginText,
                    ),
                  ),
                  const SizedBox(height: 6),

                  const Text(
                    'Welcome back to your style sanctuary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: _font,
                      fontSize: 13,
                      color: loginMuted,
                    ),
                  ),
                  const SizedBox(height: 34),

                  // EMAIL
                  _fieldLabel('Email Address'),
                  const SizedBox(height: 7),
                  _textField(
                    hint: 'hello@fashion.com',
                    controller: emailController,
                  ),
                  const SizedBox(height: 22),

                  // PASSWORD
                  Row(
                    children: [
                      _fieldLabel('Password'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'La recuperación de contraseña estará disponible próximamente.',
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: _font,
                            fontSize: 11,
                            color: loginPink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  _passwordField(),
                  const SizedBox(height: 24),

                  // SIGN IN
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _iniciarSesion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: loginPink,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shadowColor: const Color(0x55E91E63),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: _font,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),

                  // DIVISOR
                  Row(
                    children: const [
                      Expanded(child: Divider(color: Color(0xFFE6E2E4))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            fontFamily: _font,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                            color: Color(0xFFA4A5AD),
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xFFE6E2E4))),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // GOOGLE + iOS
                  Row(
                    children: [
                      Expanded(child: _socialButton(google: true)),
                      const SizedBox(width: 12),
                      Expanded(child: _socialButton(apple: true)),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // SIGN UP
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: _font,
                        fontSize: 11,
                        color: loginMuted,
                      ),
                      children: [
                        TextSpan(text: "Don't have an account?  "),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: loginPink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LOGO ELEGANCE
  // ============================================================

  Widget _logo() {
    return Container(
      width: 62,
      height: 62,
      decoration: const BoxDecoration(
        color: Color(0xFFFCE0EB),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CustomPaint(
            painter: _HangerPainter(loginPink),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LABEL
  // ============================================================

  Widget _fieldLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: _font,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3B3F4A),
        ),
      ),
    );
  }

  // ============================================================
  // EMAIL FIELD
  // ============================================================

  Widget _textField({
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(fontFamily: _font, fontSize: 13),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: _font,
          fontSize: 12,
          color: Color(0xFFAEB1B8),
        ),
        prefixIcon: const Icon(
          Icons.mail_outline_rounded,
          size: 19,
          color: Color(0xFFAEB1B8),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Color(0xFFE3E1E4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Color(0xFFE3E1E4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: loginPink, width: 1.5),
        ),
      ),
    );
  }

  // ============================================================
  // PASSWORD FIELD
  // ============================================================

  Widget _passwordField() {
    return TextField(
      controller: passwordController,
      obscureText: obscure,
      style: const TextStyle(fontFamily: _font, fontSize: 13),
      decoration: InputDecoration(
        hintText: '••••••••',
        hintStyle: const TextStyle(
          fontFamily: _font,
          fontSize: 13,
          letterSpacing: 2,
          color: Color(0xFFAEB1B8),
        ),
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          size: 19,
          color: Color(0xFFAEB1B8),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: Icon(
            obscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 19,
            color: const Color(0xFFAEB1B8),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Color(0xFFE3E1E4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Color(0xFFE3E1E4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: loginPink, width: 1.5),
        ),
      ),
    );
  }

  // ============================================================
  // GOOGLE / iOS
  // ============================================================

  Widget _socialButton({bool google = false, bool apple = false}) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFE3E1E4)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: google
            ? Image.network(
                'https://developers.google.com/identity/images/g-logo.png',
                width: 20,
                height: 20,
                errorBuilder: (_, __, ___) => const Text(
                  'G',
                  style: TextStyle(
                    fontFamily: _font,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4285F4),
                  ),
                ),
              )
            : apple
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.apple, size: 20, color: Colors.black),
                      SizedBox(width: 6),
                      Text(
                        'iOS',
                        style: TextStyle(
                          fontFamily: _font,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
      ),
    );
  }
}

// ============================================================
// GANCHO (HANGER) DIBUJADO A MANO
// ============================================================

class _HangerPainter extends CustomPainter {
  final Color color;
  _HangerPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.11
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Gancho (loop) en la parte superior
    final hookRect = Rect.fromCenter(
      center: Offset(w * 0.5, h * 0.16),
      width: w * 0.26,
      height: h * 0.26,
    );
    canvas.drawArc(hookRect, math.pi * 0.15, math.pi * 1.7, false, paint);

    // Brazos en "V" desde el vértice hacia los lados
    final arms = Path()
      ..moveTo(w * 0.5, h * 0.32)
      ..quadraticBezierTo(w * 0.5, h * 0.40, w * 0.10, h * 0.78)
      ..moveTo(w * 0.5, h * 0.32)
      ..quadraticBezierTo(w * 0.5, h * 0.40, w * 0.90, h * 0.78);
    canvas.drawPath(arms, paint);

    // Barra inferior
    canvas.drawLine(
      Offset(w * 0.10, h * 0.78),
      Offset(w * 0.90, h * 0.78),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _HangerPainter oldDelegate) =>
      oldDelegate.color != color;
}