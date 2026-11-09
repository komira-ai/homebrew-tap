class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.81/tierstore-0.3.81-macos-arm64.tar.gz"
      sha256 "72da11acf208a6aaed92fff72f7497867a36b2b3e795f8c93ddc7e1cacdea3e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.81/tierstore-0.3.81-linux-aarch64.tar.gz"
      sha256 "e46350e5b729cda170f296e9174627e9c4919c672a970680bd0645dade4dbeb7"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.81/tierstore-0.3.81-linux-x86_64.tar.gz"
      sha256 "a56ab6c644edc37fb9b0476c0d0ef7211e4cbdacba852f25737fc55177ffcd6e"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
