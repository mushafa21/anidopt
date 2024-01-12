import 'package:anidopt/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final PostRepository _postRepository = PostRepository();
  FeedCubit() : super(FeedInitial());

  Stream<QuerySnapshot<Map<String, dynamic>>>  getPostStream() {
    return _postRepository.getPostStream();
  }
}
