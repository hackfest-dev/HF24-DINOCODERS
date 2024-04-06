import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'payment_g_a_t_e_model.dart';
export 'payment_g_a_t_e_model.dart';

class PaymentGATEWidget extends StatefulWidget {
  const PaymentGATEWidget({super.key});

  @override
  State<PaymentGATEWidget> createState() => _PaymentGATEWidgetState();
}

class _PaymentGATEWidgetState extends State<PaymentGATEWidget> {
  late PaymentGATEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentGATEModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 48.0,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Home');
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ubmkbmtr' /* Proceed to Pay */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(150.0),
                          bottomRight: Radius.circular(150.0),
                          topLeft: Radius.circular(150.0),
                          topRight: Radius.circular(150.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                formatNumber(
                                  FFAppState().cartsum,
                                  formatType: FormatType.custom,
                                  currency: '',
                                  format: '',
                                  locale: '',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 45.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.generatedOrder = actions.orderGenerator();
                      _model.apiResult9d5 = await GenTokenCall.call(
                        amount: formatNumber(
                          FFAppState().cartsum,
                          formatType: FormatType.custom,
                          currency: '',
                          format: '',
                          locale: '',
                        ),
                      );
                      _model.verifypayment = await VerifySignatureCall.call(
                        orderId: 'NA',
                        orderAmount: 'NA',
                        referenceId: 'NA',
                        txStatus: 'NA',
                        paymentMode: 'NA',
                        txMsg: 'NA',
                        txTime: 'NA',
                        signature: 'NA',
                        secretKey:
                            'cfsk_ma_prod_b7f519196c888f6ada0cd6a982e3ac9d_402c0b7b',
                      );
                      if (getJsonField(
                        (_model.verifypayment?.jsonBody ?? ''),
                        r'''$''',
                      )) {
                        context.pushNamed('homepage');
                      } else {
                        context.pushNamed('homepage');
                      }

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '6ghnovjf' /* Click Here to  Pay */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
