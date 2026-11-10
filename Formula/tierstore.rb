class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.85/tierstore-0.3.85-macos-arm64.tar.gz"
      sha256 "41fabd794c1ba2d15269d373613d1044f181169047a29171bd7935e4cf7203d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.85/tierstore-0.3.85-linux-aarch64.tar.gz"
      sha256 "cc1fd869dfc34f42896ef87edec8a2f76c71f3a35bbf58b33e4c268764fdc7f2"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.85/tierstore-0.3.85-linux-x86_64.tar.gz"
      sha256 "9595bd0214b1a1253a90f994e140a5a8bf55accaecf6a8764f289aa33bd73919"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
