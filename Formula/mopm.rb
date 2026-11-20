class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.121/mopm-0.0.121-macos-arm64.tar.gz"
      sha256 "99170e275849b74fc5975cde2693af7a558732f059748001de3f509007d7f653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.121/mopm-0.0.121-linux-aarch64.tar.gz"
      sha256 "07dca96dbffc15cfe4589207b157fbd758a90620401ef0b60bcfee6542c3f052"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.121/mopm-0.0.121-linux-x86_64.tar.gz"
      sha256 "80d98998a45f8d68a74f492826e6d0d37f68027b2da0490f6d3115bdb131613c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
