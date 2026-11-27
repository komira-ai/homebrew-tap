class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.197/tierstore-0.3.197-macos-arm64.tar.gz"
      sha256 "08333c28fa86bbf09496d1416a7ddea69f1ff09eceecc070dc3ecdc5d08cad7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.197/tierstore-0.3.197-linux-aarch64.tar.gz"
      sha256 "63b319f77b1ff6d900c5e1dd9597e804e53904a6391614d12b7fab0dd1cb569a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.197/tierstore-0.3.197-linux-x86_64.tar.gz"
      sha256 "4ea452c73ae5bbbee77da8180b24813c7c0bbcd877e704c4bc2cb0957a7d90e7"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
