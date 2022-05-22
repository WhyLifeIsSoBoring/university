import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:social_event/bloc/social_event_bloc.dart';

class SocialEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialEventBloc, SocialEventState>(
      builder: (BuildContext context, SocialEventState state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Мероприятия',
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                context.read<SocialEventBloc>().add(Pop());
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      Text(
                        state.event.title,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CachedNetworkImage(
                            imageUrl: state.event.imageUrl),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        state.event.description,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        state.event.date,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                if (state.isRegisterButtonEnabled) ...<Widget>{
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<SocialEventBloc>()
                                    .add(Registration());
                                _showSnackBar(context);
                              },
                              child: Center(
                                child: Text('Регистрация на мероприятие'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                }
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Заявка на регистрацию на мероприятие отправлена'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
