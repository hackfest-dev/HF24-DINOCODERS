import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'g_m_odetails_model.dart';
export 'g_m_odetails_model.dart';

class GMOdetailsWidget extends StatefulWidget {
  const GMOdetailsWidget({super.key});

  @override
  State<GMOdetailsWidget> createState() => _GMOdetailsWidgetState();
}

class _GMOdetailsWidgetState extends State<GMOdetailsWidget> {
  late GMOdetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GMOdetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://picsum.photos/seed/124/600',
                      width: 80.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'idpxabni' /* GMO */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: SelectionArea(
                                child: Text(
                              FFLocalizations.of(context).getText(
                                'dsft8g4p' /* Hybrid */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'xye653jk' /* Notes & descriptions go here t... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            170.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Buy pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            '6yi2s0po' /* Buy */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
