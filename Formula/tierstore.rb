class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.116/tierstore-0.3.116-macos-arm64.tar.gz"
      sha256 "548bf0d98c567808e07f6054ce37e711e1d39314d56b13846461859cc7a5c306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.116/tierstore-0.3.116-linux-aarch64.tar.gz"
      sha256 "3b116b982f06c12d6f059df24af63492464fa2076618ba803f8010fba7f7ae90"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.116/tierstore-0.3.116-linux-x86_64.tar.gz"
      sha256 "c40c86a54fb4e48bf3f6845b395c71063ab7006e55804a54a3d0b030e3f2805f"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
