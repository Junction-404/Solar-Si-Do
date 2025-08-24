import Lottie

class LottieViewCacheManager {
    static let shared = LottieViewCacheManager()

    private var cache: [String: LottieAnimation] = [:]

    private init() {}

    func preload(named name: String) {
        guard cache[name] == nil else { return }

        if let animation = LottieAnimation.named(name) {
            cache[name] = animation
        }
    }

    func animation(named name: String) -> LottieAnimation? {
        return cache[name]
    }
}
