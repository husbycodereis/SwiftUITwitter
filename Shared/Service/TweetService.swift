//
//  TweetServoc.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import Firebase

class TweetService {
    func uploadTweet(caption: String, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let data = [
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timestamp": Timestamp(date: Date())
        ] as [String: Any]
        Firestore.firestore().collection("tweets").document().setData(data) { error in
            if let error = error {
                completion(false)
                print("There was an error uploading the tweet: \(error.localizedDescription)")
                return
            }
            completion(true)
        }
    }

    func fetchTweets(completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            //compactMap works as foreach loop
            // $0 represents each elements inside a list
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets)

        }
    }

    func fetchTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            //compactMap works as foreach loop
            // $0 represents each elements inside a list
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets)

        }
    }


}

extension TweetService {

    func likeTweet(_ tweet: Tweet, completion: @escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetID = tweet.id else { return }

        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")

        Firestore.firestore().collection("tweets").document(tweetID).updateData(["likes": tweet.likes + 1]) { _ in
            userLikesRef.document(tweetID).setData([:]) { _ in
                print("DEBUG SET tweet likes")
                completion()
            }
        }
    }

    func unlikeTweet(_ tweet: Tweet, completion: @escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetID = tweet.id else { return }
        guard tweet.likes > 0 else { return }

        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")

        Firestore.firestore().collection("tweets").document(tweetID).updateData(["likes": tweet.likes - 1]) { _ in
            userLikesRef.document(tweetID).delete { _ in
                completion()
            }
        }
    }

    func checkIfUserLikedTweet(_ tweet: Tweet, completon: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetID = tweet.id else { return }

        Firestore.firestore().collection("users").document(uid).collection("user-likes").document(tweetID).getDocument { snapshot, _ in
            guard let snapshot = snapshot else {
                return
            }

            completon(snapshot.exists)
        }
    }

    func fetchLikedTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {
        var likedTweets = [Tweet]()
        Firestore.firestore().collection("users").document(uid).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            documents.forEach { document in
                let tweetID = document.documentID

                Firestore.firestore().collection("tweets").document(tweetID).getDocument { snapshot, _ in
                    guard let tweet = try? snapshot?.data(as: Tweet.self) else { return }
                    likedTweets.append(tweet)
                    completion(likedTweets)
                }
            }

        }
    }
}
