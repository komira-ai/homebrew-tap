class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.198/tierstore-0.3.198-macos-arm64.tar.gz"
      sha256 "8ae13ba6b74bfd88335b87d9a7a7012d8d9a43302afc621bf58108899d5dac57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.198/tierstore-0.3.198-linux-aarch64.tar.gz"
      sha256 "c4fce8a3be917981224baa551e8f81f93b1968152f433617b367e4cb8d48aad9"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.198/tierstore-0.3.198-linux-x86_64.tar.gz"
      sha256 "e43f462f92ef9bb2a742ad0bf62f54b96c3448f5d4808cfc41660226ca4b9828"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
