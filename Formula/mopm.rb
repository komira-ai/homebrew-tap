class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.140/mopm-0.0.140-macos-arm64.tar.gz"
      sha256 "1444452ab93b8505b395538b7902c7987a956d0904044be6f80c8dafa6983f25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.140/mopm-0.0.140-linux-aarch64.tar.gz"
      sha256 "a358da6587c2aa32452391f1266c004253e096f91f9c0fe265ce48b8f5f2b3ec"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.140/mopm-0.0.140-linux-x86_64.tar.gz"
      sha256 "0c3aaf74165fbfdf91b9dcc9137fe3d08e8b60d2d8f5c1a34ac6c391864bd549"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
