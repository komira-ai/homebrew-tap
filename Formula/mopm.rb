class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.21/mopm-0.0.21-macos-arm64.tar.gz"
      sha256 "ecd47872a7190b78d866da13304677840891dd0c83ed4452b30e8e7cace1ac6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.21/mopm-0.0.21-linux-aarch64.tar.gz"
      sha256 "e1c56d8d746fb897c6e29bf99247fc208b104b91621f41af8378bc08423bdd80"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.21/mopm-0.0.21-linux-x86_64.tar.gz"
      sha256 "57ad9a7a52c664cf470bc70abd3a6fd582b5dfe060cea1abe539fa225728b17a"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
