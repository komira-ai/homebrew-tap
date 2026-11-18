class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.123/tierstore-0.3.123-macos-arm64.tar.gz"
      sha256 "3275addaf4131dd7e3f6fbc983d34d98f718b4d4ae0f2210b37dae1df70363bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.123/tierstore-0.3.123-linux-aarch64.tar.gz"
      sha256 "888f47f100ae75b7be9824ef83f0353fcfebe76e10b40aa124e5dd149553b83f"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.123/tierstore-0.3.123-linux-x86_64.tar.gz"
      sha256 "400f688ddf49b9c104d9cabec007e945e2c2ffa7e0ade9462c65d080d769a9e0"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
