
// class NewsFeedBloc
//     extends Bloc<NewsFeedEvent, NewsFeedState> {
//   final CommonRepository repository;
//   int page = 1;
//   NewsFeedBloc(this.repository) : super(NewsFeedLoading()) {
//     on<NewsFeedStartEvent>((event, emit) async {
//       try {
//         emit(NewsFeedLoading());
//         page = 1;
//         final NewsFeedModel userData =
//             await repository.getNotifications(page);

//         emit(NewsFeedSuccess(
//             userData, userData.detail?.data?.resultsData ?? []));
//       } on DioException catch (e) {
//         if (e.response?.statusCode != 500) {
//           emit(NewsFeedFailure(
//               ErrorResponse.fromJson(e.response?.data)));
//         } else {
//           emit(const NewsFeedFailure(null));
//         }
//       } catch (e) {
//         emit(const NewsFeedFailure(null));
//       }
//     });
//     on<FetchMoreEvent>((event, emit) async {
//       final currentState = state;
//       if (currentState is NewsFeedSuccess &&
//           currentState.tasks.length == page * 10 &&
//           currentState.localData.detail?.data?.pagination?.hasNextPage ==
//               true &&
//           currentState.localData.detail!.data!.pagination!.totalPages! > page) {
//         try {
//           page++;
//           final NewsFeedModel userData =
//               await repository.getNotifications(page);

//           emit(NewsFeedSuccess(userData,
//               currentState.tasks + userData.detail!.data!.resultsData!));
//         } on DioException catch (e) {
//           if (e.response != null && e.response?.statusCode != 500) {
//             emit(NewsFeedFailure(
//                 ErrorResponse.fromJson(e.response?.data)));
//           } else {
//             // emit(const NewsFeedFailure(null));
//           }
//         } catch (_) {}
//       }
//     });
//   }
// }
